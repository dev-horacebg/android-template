# Template project

Multi-module Android project that uses clean architecture

- Enforces separation of Data, View and data layers by creating submodules within
each feature module.

Additional feature modules can be created by running the included script: `createmodule.sh`

```
sh createmodule.sh feature1
```

If creating a no-view module, simply specify --skip-view

```
sh createmodule.sh feature1 --skip-view
```

To see the dependency graph, run:

```
./gradlew projectDependencyGraph
```

The output will be located in /${projectName}/build/reports/dependency-graph/project.dot.png
