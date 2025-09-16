import type { NavigationModule, State } from '../types';

export const navigationModules: NavigationModule[] = [
  {
    id: 'fra-data',
    title: 'FRA Data Management',
    description: 'Document Upload & Digitization, Legacy Data Integration, Claim Status Tracking',
    icon: 'Description',
    route: '/fra-data',
    color: '#1976d2',
    userRoles: ['ministry', 'district', 'admin']
  },
  {
    id: 'atlas-mapping',
    title: 'FRA Atlas & Mapping',
    description: 'Basic Atlas Interface, Government Scheme Integration, Regional Mapping',
    icon: 'Map',
    route: '/atlas',
    color: '#388e3c',
    userRoles: ['ministry', 'district', 'forest', 'ngo', 'admin']
  },
  {
    id: 'webgis-integration',
    title: 'WebGIS Integration',
    description: 'Interactive Layers (IFR/CFR), Village Boundaries, Land-use Mapping, FRA Progress Tracking',
    icon: 'Map',
    route: '/webgis',
    color: '#00796b',
    userRoles: ['ministry', 'district', 'forest', 'admin']
  },
  {
    id: 'ai-processing',
    title: 'AI Processing Center',
    description: 'OCR Document Processing, Satellite Image Analysis, Asset Detection Results',
    icon: 'Psychology',
    route: '/ai-processing',
    color: '#f57c00',
    userRoles: ['ministry', 'admin']
  },
  {
    id: 'decision-support',
    title: 'Decision Support System',
    description: 'CSS Scheme Recommendations, Eligibility Analysis, Priority Interventions',
    icon: 'Analytics',
    route: '/dss',
    color: '#7b1fa2',
    userRoles: ['ministry', 'district', 'admin']
  },
  {
    id: 'analytics-reports',
    title: 'Analytics & Reports',
    description: 'State-wise Progress, District-level Statistics, Implementation Dashboards',
    icon: 'Assessment',
    route: '/analytics',
    color: '#d32f2f',
    userRoles: ['ministry', 'district', 'forest', 'revenue', 'admin']
  },
  {
    id: 'admin-panel',
    title: 'Admin Panel',
    description: 'User Management, System Configuration, Data Import/Export',
    icon: 'AdminPanelSettings',
    route: '/admin',
    color: '#455a64',
    userRoles: ['admin']
  }
];

export const states: State[] = [
  {
    id: 'mp',
    name: 'Madhya Pradesh',
    code: 'MP'
  },
  {
    id: 'tripura',
    name: 'Tripura',
    code: 'TR'
  },
  {
    id: 'odisha',
    name: 'Odisha',
    code: 'OD'
  },
  {
    id: 'telangana',
    name: 'Telangana',
    code: 'TG'
  }
];
