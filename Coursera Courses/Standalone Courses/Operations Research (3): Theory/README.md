<a href="https://www.coursera.org/learn/operations-research-theory">
  <img src="/img/Operations_Research_(3)_Theory_logo.avif" width="150" align="right">
</a>

<img src="https://upload.wikimedia.org/wikipedia/en/7/7e/National_Taiwan_University_seal.svg" width="120" height="120" align="left">

# Operations Research (3): Theory

Offered by 
### *National Taiwan University*

Taught by: [Ling-Chieh Kung](https://www.coursera.org/instructor/lckung)

---

**14 hours** to complete - 8 quizzes 

---

## Course description

>"The series of courses consists of three parts, we focus on deterministic optimization techniques, which is a major part of the field of OR.
As the third part of the series, we study mathematical properties of linear programs, integer programs, and nonlinear programs. We also introduce applications of these theoretical properties: How they help us develop better ways to solve mathematical programs."

<p align="right">More details on <a href="https://www.coursera.org/learn/operations-research-theory">website</a></p>

## Content
This folder contains 
- [x] [slides](./Slides) 
- [x] [Jupyter notebooks](./Jupyter%20notebooks) of the demonstrations (and pdf notes on them)
- [x] [certificate](./Coursera_Certificate_Operations_Research_(3)_Theory.pdf) ([verification](https://coursera.org/verify/GDK87SR66HD6))

## Remarks
- The course is really fun. The lecturer is thorough, shares the slides, it is easy to follow the well structured lectures. 
- For some practical calculations the course intorduces and uses the [Gurobi Optimizer](https://www.gurobi.com/products/gurobi-optimizer/). All the Jupyter notebooks use this tool. 
- As the title suggests, the course has its sister-courses 
[Operations Research (1): Models and Applications](../Operations%20Research%20(1):%20Models%20and%20Applications) and 
[Operations Research (2): Optimization Algorithms](../Operations%20Research%20(2):%20Optimization%20Algorithms), even though they are not a Coursera specialization.

## Syllabus

### Week 1: **Course Overview** ([Slides](./Slides/OR3_01_theoryIntro.pdf))
>"In the first lecture, after introducing the course and the importance of mathematical properties, we study the matrix way to run the simplex method. Being more familiar with matrices will help us understand further lectures.
>- After the lecture, students can learn why we should study on the theories of Operations Research and understand the formulation and applications of the simplex method in matrices."

### Week 2: **Duality** ([Slides](./Slides/OR3_02_LPduality.pdf))
>"In this week, we study the theory and applications of linear programming duality. We introduce the properties possessed by primal-dual pairs, including weak duality, strong duality, complementary slackness, and how to construct a dual optimal solution given a primal optimal one. We also introduce one important application of linear programming duality: Using shadow prices to determine the most critical constraint in a linear program.
>- Formulate the primal-dual pairs of linear programs, understanding its theories, and getting some ideas about its applications."

### Week 3: **Sensitivity Analysis and Dual Simplex Method** ([Slides](./Slides/OR3_03_dualSimplex.pdf))
>"In the past two weeks, we study the simplex method and the duality. On top of them, the dual simplex method is discussed in this lecture. We apply it to one important issue in sensitivity analysis: evaluating a linear programming model with a new constraint. A linear programming model with a new variable is also discussed.
>- Evaluate a model with a new variable or a new constraint.
>- Understand how the dual simplex may be applied in many cases, e.g., in implementing the branch-and-bound algorithm."

### Week 4: **Network Flow** ([Slides](./Slides/OR3_04_networkFlow.pdf))
>"In this lecture, we introduce network flow models, which are widely used for making decision regarding transportation, logistics, inventory, project management, etc. We first introduce the minimum cost network flow (MCNF) model and show hot it is the generalization of many famous models, including assignment, transportation, transshipment, maximum flow, and shortest path. We also prove a very special property of MCNF, total unimodularity, and how it connects linear programming and integer programming. 
>- Understand network flow models and apply them to real-world problems.
>- Understand why an optimal solution of an MCNF problem may be guaranteed to be an integer solution."

### Week 5: **Convex Analysis** ([Slides](./Slides/OR3_05_convexity.pdf))
>"As the last lesson of this course, we introduce a case of NEC Taiwan, which provides IT and network solutions including cloud computing, AI, IoT etc. Since maintaining all its service hubs is too costly, they plan to rearrange the locations of the hubs and reallocate the number of employees in each hub. An algorithm is included to solve the facility location problem faced by NEC Taiwan.

### Week 6: **Lagrangian Duality and the KKT condition** ([Slides](./Slides/OR3_06_lagrangeKKT.pdf))
>"In this week, we study nonlinear programs with constraints. We introduce two major tools, Lagrangian relaxation and the KKT condition, for solving constrained nonlinear programs. We also see how linear programming duality is a special case of Lagrangian duality.
>- Tackle multi-variate constrained nonlinear programs in an analytical way.
>- Obtain economic interpretations for an optimal analytical solution."

### Week 7: **Case Study** ([Slides](./Slides/OR3_07_theoryCase.pdf))
>"In this week, we introduce two well-known models constructed by applying the mathematical properties we have introduced. First, we formulate a simple linear regression problem as a nonlinear program and derive the closed-form regression formula. Second, we introduce support-vector machine, one of the most famous classification model, from the perspective of duality..
>- After the lecture, students will see how all the analyses we introduce in this course may be applied to construct useful statistical and machine learning models."

### Week 8: **Course Summary and Future Learning Directions** ([Slides](./Slides/OR3_08_theorySummary.pdf))
>"In the final week, we review the topics we have introduced and give some concluding remarks. We also provide some learning directions for advanced studies.y.
>- After this lecture, students will wrap up the whole course and have the directions for further studies."
