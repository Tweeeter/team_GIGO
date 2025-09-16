import { Box, Typography, Paper, Container } from '@mui/material';

const DSSPage = () => {
  return (
    <Container maxWidth="lg" sx={{ py: 4 }}>
      <Paper elevation={3} sx={{ p: 4 }}>
        <Typography variant="h4" component="h1" gutterBottom color="primary">
          📊 Decision Support System
        </Typography>
        <Typography variant="body1" sx={{ mb: 2 }}>
          Intelligent decision-making tools:
        </Typography>
        <Box component="ul" sx={{ pl: 3 }}>
          <Typography component="li" variant="body1">
            CSS Scheme Recommendations (PM-KISAN, Jal Jeevan Mission, MGNREGA)
          </Typography>
          <Typography component="li" variant="body1">
            Eligibility Analysis for FRA patta holders
          </Typography>
          <Typography component="li" variant="body1">
            Priority Interventions based on mapped data
          </Typography>
          <Typography component="li" variant="body1">
            DAJGUA scheme integration and layering
          </Typography>
        </Box>
      </Paper>
    </Container>
  );
};

export default DSSPage;
