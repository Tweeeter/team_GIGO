import React, { useEffect, useRef } from 'react';
import L from 'leaflet';
import 'leaflet/dist/leaflet.css';

// Fix leaflet default markers
delete (L.Icon.Default.prototype as any)._getIconUrl;
L.Icon.Default.mergeOptions({
  iconRetinaUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/images/marker-icon-2x.png',
  iconUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/images/marker-icon.png',
  shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/1.9.4/images/marker-shadow.png',
});

// Mock GeoJSON data for IFR/CFR claims
const mockIFRClaims = {
  "type": "FeatureCollection" as const,
  "features": [
    {
      "type": "Feature",
      "properties": {
        "claimId": "IFR001",
        "claimantName": "Ramesh Kumar",
        "status": "Approved",
        "area": "2.5 hectares",
        "claimType": "IFR",
        "submissionDate": "2023-06-15"
      },
      "geometry": {
        "type": "Point",
        "coordinates": [78.5, 23.2]
      }
    },
    {
      "type": "Feature", 
      "properties": {
        "claimId": "IFR002",
        "claimantName": "Sita Devi",
        "status": "Pending",
        "area": "1.8 hectares",
        "claimType": "IFR",
        "submissionDate": "2023-07-20"
      },
      "geometry": {
        "type": "Point",
        "coordinates": [78.3, 23.5]
      }
    }
  ]
};

const mockCFRClaims = {
  "type": "FeatureCollection" as const, 
  "features": [
    {
      "type": "Feature",
      "properties": {
        "claimId": "CFR001",
        "claimantName": "Adivasi Samiti Gwalior",
        "status": "Approved",
        "area": "15.2 hectares",
        "claimType": "CFR",
        "submissionDate": "2023-05-10"
      },
      "geometry": {
        "type": "Point",
        "coordinates": [78.7, 23.8]
      }
    }
  ]
};

// Mock Village Assets data
const mockVillageAssets = {
  "type": "FeatureCollection" as const,
  "features": [
    {
      "type": "Feature",
      "properties": {
        "assetId": "AST001",
        "assetType": "School Building", 
        "condition": "Good",
        "villageCode": "V123",
        "villageName": "Rampur",
        "detectedBy": "AI Asset Detection",
        "confidence": 0.92,
        "lastUpdated": "2024-01-15"
      },
      "geometry": {
        "type": "Point",
        "coordinates": [78.4, 23.3]
      }
    },
    {
      "type": "Feature",
      "properties": {
        "assetId": "AST002", 
        "assetType": "Water Tank",
        "condition": "Needs Repair",
        "villageCode": "V124",
        "villageName": "Govindpur",
        "detectedBy": "Satellite Analysis",
        "confidence": 0.87,
        "lastUpdated": "2024-01-20"
      },
      "geometry": {
        "type": "Point",
        "coordinates": [78.6, 23.6]
      }
    },
    {
      "type": "Feature",
      "properties": {
        "assetId": "AST003",
        "assetType": "Community Hall",
        "condition": "Excellent", 
        "villageCode": "V125",
        "villageName": "Shivnagar",
        "detectedBy": "Ground Survey",
        "confidence": 1.0,
        "lastUpdated": "2024-01-25"
      },
      "geometry": {
        "type": "Point",
        "coordinates": [78.8, 23.4]
      }
    }
  ]
};

const SimpleMap: React.FC = () => {
  const mapRef = useRef<HTMLDivElement>(null);
  const mapInstanceRef = useRef<L.Map | null>(null);

  useEffect(() => {
    if (mapRef.current && !mapInstanceRef.current) {
      // Create map instance directly with Leaflet
      mapInstanceRef.current = L.map(mapRef.current, {
        center: [23.0, 78.0],
        zoom: 6,
      });

      // Add tile layer
      L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
      }).addTo(mapInstanceRef.current);

      // Add IFR Claims layer
      L.geoJSON(mockIFRClaims, {
        pointToLayer: (feature, latlng) => {
          const status = feature.properties.status;
          let color = '#F44336'; // Default: Rejected
          if (status === 'Approved') color = '#4CAF50';
          else if (status === 'Pending') color = '#FF9800';
          
          return L.circleMarker(latlng, {
            radius: 8,
            fillColor: color,
            color: '#fff',
            weight: 2,
            opacity: 1,
            fillOpacity: 0.8
          });
        },
        onEachFeature: (feature, layer) => {
          const props = feature.properties;
          let statusColor = '#F44336';
          if (props.status === 'Approved') statusColor = '#4CAF50';
          else if (props.status === 'Pending') statusColor = '#FF9800';
          
          layer.bindPopup(`
            <div style="font-family: Arial, sans-serif;">
              <h4 style="margin: 0 0 8px 0; color: #2196F3;">🌳 ${props.claimType} Claim</h4>
              <p style="margin: 4px 0;"><strong>ID:</strong> ${props.claimId}</p>
              <p style="margin: 4px 0;"><strong>Claimant:</strong> ${props.claimantName}</p>
              <p style="margin: 4px 0;"><strong>Status:</strong> <span style="color: ${statusColor};">${props.status}</span></p>
              <p style="margin: 4px 0;"><strong>Area:</strong> ${props.area}</p>
              <p style="margin: 4px 0;"><strong>Submitted:</strong> ${props.submissionDate}</p>
            </div>
          `);
        }
      }).addTo(mapInstanceRef.current);

      // Add CFR Claims layer  
      L.geoJSON(mockCFRClaims, {
        pointToLayer: (feature, latlng) => {
          const status = feature.properties.status;
          let color = '#E91E63'; // Default: Rejected
          if (status === 'Approved') color = '#8BC34A';
          else if (status === 'Pending') color = '#FFC107';
          
          return L.circleMarker(latlng, {
            radius: 12,
            fillColor: color,
            color: '#fff',
            weight: 2,
            opacity: 1,
            fillOpacity: 0.7
          });
        },
        onEachFeature: (feature, layer) => {
          const props = feature.properties;
          let statusColor = '#E91E63';
          if (props.status === 'Approved') statusColor = '#8BC34A';
          else if (props.status === 'Pending') statusColor = '#FFC107';
          
          layer.bindPopup(`
            <div style="font-family: Arial, sans-serif;">
              <h4 style="margin: 0 0 8px 0; color: #8BC34A;">🏢 ${props.claimType} Claim</h4>
              <p style="margin: 4px 0;"><strong>ID:</strong> ${props.claimId}</p>
              <p style="margin: 4px 0;"><strong>Community:</strong> ${props.claimantName}</p>
              <p style="margin: 4px 0;"><strong>Status:</strong> <span style="color: ${statusColor};">${props.status}</span></p>
              <p style="margin: 4px 0;"><strong>Area:</strong> ${props.area}</p>
              <p style="margin: 4px 0;"><strong>Submitted:</strong> ${props.submissionDate}</p>
            </div>
          `);
        }
      }).addTo(mapInstanceRef.current);

      // Add Village Assets layer
      L.geoJSON(mockVillageAssets, {
        pointToLayer: (feature, latlng) => {
          const assetType = feature.properties.assetType;
          const condition = feature.properties.condition;
          
          // Asset type colors
          let color = '#FF9800'; // Default
          
          if (assetType.includes('School')) {
            color = '#2196F3';
          } else if (assetType.includes('Water')) {
            color = '#00BCD4';
          } else if (assetType.includes('Hall') || assetType.includes('Community')) {
            color = '#9C27B0';
          }

          // Condition-based border color
          let borderColor = '#4CAF50'; // Good
          if (condition === 'Needs Repair') borderColor = '#FF5722';
          else if (condition === 'Excellent') borderColor = '#8BC34A';

          return L.circleMarker(latlng, {
            radius: 10,
            fillColor: color,
            color: borderColor,
            weight: 3,
            opacity: 1,
            fillOpacity: 0.8
          });
        },
        onEachFeature: (feature, layer) => {
          const props = feature.properties;
          let conditionColor = '#4CAF50';
          if (props.condition === 'Needs Repair') conditionColor = '#FF5722';
          else if (props.condition === 'Excellent') conditionColor = '#8BC34A';

          let confidenceText = '';
          if (props.confidence < 1.0) {
            confidenceText = `<p style="margin: 4px 0;"><strong>AI Confidence:</strong> ${(props.confidence * 100).toFixed(0)}%</p>`;
          }
          
          layer.bindPopup(`
            <div style="font-family: Arial, sans-serif;">
              <h4 style="margin: 0 0 8px 0; color: #FF9800;">🏗️ Village Asset</h4>
              <p style="margin: 4px 0;"><strong>ID:</strong> ${props.assetId}</p>
              <p style="margin: 4px 0;"><strong>Type:</strong> ${props.assetType}</p>
              <p style="margin: 4px 0;"><strong>Village:</strong> ${props.villageName} (${props.villageCode})</p>
              <p style="margin: 4px 0;"><strong>Condition:</strong> <span style="color: ${conditionColor};">${props.condition}</span></p>
              <p style="margin: 4px 0;"><strong>Detected by:</strong> ${props.detectedBy}</p>
              ${confidenceText}
              <p style="margin: 4px 0;"><strong>Last Updated:</strong> ${props.lastUpdated}</p>
            </div>
          `);
        }
      }).addTo(mapInstanceRef.current);
    }

    // Cleanup function
    return () => {
      if (mapInstanceRef.current) {
        mapInstanceRef.current.remove();
        mapInstanceRef.current = null;
      }
    };
  }, []);

  return (
    <div
      ref={mapRef}
      style={{ height: '500px', width: '100%' }}
    />
  );
};

export default SimpleMap;