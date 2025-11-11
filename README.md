# ds5030-project-1
Quantifying the "rubber band effect" in NCAAM

### Instructions
Submit a document or notebook that clearly addresses the following:

Describe the data clearly -- particularly any missing data that might impact your analysis -- and the provenance of your dataset. Who collected the data and why? (10/100 pts)


## Phenomenon Description
What phenomenon are you modeling? Provide a brief background on the topic, including definitions and details that are relevant to your analysis. Clearly describe its main features, and support those claims with data where appropriate. (10/100 pts)

This project seeks to model the 'rubber band effect' in NCAA and professional basketball. The premise of this effect is that a large score differential between two teams usually trends closer to zero, and this is primarily because the leading team relaxes their effort while the trailing team exerts more effort to catch up. This effect is often discussed in sports analytics circles as a psychological phenomenon that can influence the outcome of games. *****WE NEED TO SUPPORT WITH DATA ******


## Non-Parametric Model Description
Describe your non-parametric model (empirical cumulative distribution functions, kernel density function, local constant least squares regression, Markov transition models). How are you fitting your model to the phenomenon to get realistic properties of the data? What challenges did you have to overcome? (15/100 pts)

Our model is a Markov transition model that defines states based on score differential intervals. The states are defined as follows: [-30,-25), [-25,-20), [-20,-15), [-15,-10), [-10,-5), [-5,0), [0,5), [5,10), [10,15), [15,20), [20,25), [25,30) where each of the values represents a score differential. The transition time periods are 10 possessions, or 5 possessions per team. A typical team will have between 7 and 8 possessions per half. We fit the model by estimating the transition probabilities between these states using historical game data. The game was broken up into segments of 10 possessions, and the score differential at the start and end of each segment was recorded. The transition matrix was then constructed by calculating the frequency of transitions from one state to another and normalizing these frequencies to obtain probabilities. These probabilities were then used to populate the transition matrix. One interesting note was that teams can't go from a large negative differential to a large positive differential in a single time step, so many of the transition probabilities in the matrix are zero. This sparsity was a challenge when simulating sequences, as it limited the possible transitions that could occur in certain states. But because of our efforts to still populate the transition matrix accurately, we were able to create a realistic model of score differential changes over time in basketball games.


## Simulation

Either use your model to create new sequences (if the model is more generative) or bootstrap a quantity of interest (if the model is more inferential). (15/100 pts)

The simulation code is located in `simulation.ipynb`. We simulated the UVA vs. NC Central game from the 2025-2026 season starting at halftime. UVA was up 17 points at half, and then we modeled the second half of the game as a Markov process with states defined by score differential intervals. The transition matrix was estimated from historical data of similar games. The simulation runs 360 iterations of the second half, each consisting of 7 time steps (representing possessions). The results are visualized using a lineplot show

## Critical Evaluation
Critically evaluate your work in part 4. Do your sequences have the properties of the training data, and if not, why not? Are your estimates credible and reliable, or is there substantial uncertainty in your results? (15/100 pts)

## Conclusion
Write a conclusion that explains the limitations of your analysis and potential for future work on this topic. (10/100 pts)

In addition, submit a GitHub repo containing your code and a description of how to obtain the original data from the source. Make sure the code is commented, where appropriate. Include a .gitignore file. We will look at your commit history briefly to determine whether everyone in the group contributed. (10/100 pts)

In class, we'll briefly do presentations and criticize each other's work, and participation in your group's presentation and constructively critiquing the other groups' presentations accounts for the remaining 15/100 pts.
